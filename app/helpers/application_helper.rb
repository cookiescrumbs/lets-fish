module ApplicationHelper
  def default_meta_tags
    {
      title: "Fly fishing lakes, lochs, rivers and streams - let's fish",
      description: "Find beautiful places to go fly fishing from around the British Isles with Let's fish.",
      og: {
        title: "Fly fishing lakes, lochs, rivers and streams - let's fish",
        description: "Find beautiful places to go fly fishing from around the British Isles with Let's fish.",
        url: 'http://lets.fish',
        image: "#{asset_path 'sm_home_hero.jpg'}",
        site_name: 'Let\'s Fish'
      }
    }
  end
end
