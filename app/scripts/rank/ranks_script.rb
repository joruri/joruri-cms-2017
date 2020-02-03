class Rank::RanksScript < ParametersScript
  def exec
    contents = Rank::Content::Rank.all
    contents = contents.where(site_id: ::Script.site.id) if ::Script.site

    ::Script.total contents.size

    contents.each do |content|
      ::Script.progress(content) do
        Rank::RankFetchJob.perform_now(content, Time.now - 3.days)
        Rank::RankDeleteJob.perform_now(content)
        Rank::RankTotalJob.perform_now(content)
      end
    end
  end
end
