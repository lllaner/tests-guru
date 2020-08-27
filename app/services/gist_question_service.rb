class GistQuestionService
  attr_accessor :errors

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @errors = []
    @client = autheticate
  end

  def call
    @client.create_gist(gist_params)

  end

  def success?
    return if @errors.any?

    if @client.last_response.status == 200 && @errors.blank?
      true
    else
      @errors << "Error: #{@client.last_response.status}"
      false
    end
  end

  def autheticate
    @client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    @client if @client.user
  rescue Octokit::Unauthorized => e
    @errors << e.message
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
