module TestsHelper
  def github_url(author, rep)
    link_to 'Test-gutu', "https://github.com/#{author}/#{rep}", target: '_blank'
  end

  def year_now
    "#{Time.current.year} year"
  end
end
