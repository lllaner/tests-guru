class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    if @client.last_response.status == 201
      true
    else
      @error = "Error: #{@client.last_response.status}"
      false
    end
  end

  def errors
    @error
  end

  def not_errors
    !errors
  end

  def autheticate
    @client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    @client if @client.user
  rescue Octokit::Unauthorized => e
    @error = e.message
    false
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
