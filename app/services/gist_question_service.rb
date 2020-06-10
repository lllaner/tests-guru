class GistQuestionService
  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  rescue Octokit::Unauthorized => e
    e.message
  end

  def success?
    !!@client.last_response
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
