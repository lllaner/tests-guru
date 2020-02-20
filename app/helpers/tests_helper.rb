module TestsHelper
  def github_url(author, rep)
  link  = "https://github.com/#{author}/#{rep}"
  end

  def year_now
    year = "#{Time.current.year} year"
  end
end
