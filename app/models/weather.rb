class Weather
  def initialize(data:)
    @data = data
  end

  def wind_speed
    @data['currently']['windSpeed'] || nil
  end


  def wind_bearing
    @data['currently']['windBearing'] || nil
  end

  def lat
    @data['latitude'] || nil
  end

  def lng
    @data['longitude'] || nil
  end

  def wind_direction

    compass = {
      'N' => [*350..11],
      'NNE' => [*12..34],
      'NE' => [*35..56],
      'ENE' => [*57..78],
      'E' => [*79..102],
      'ESE' => [*103..124],
      'SE' => [*125..146],
      'SSE' => [*147..168],
      'S' => [*169..192],
      'SSW' => [*193..214],
      'SW' => [*211..236],
      'WSW' => [*237..258],
      'W' => [*259..282],
      'WNW' => [*283..304],
      'NW' => [*305..326],
      'NNW' => [*327..349]
    }

    compass.each {|key, value| break key if( value.include? wind_bearing )  }

  end

  def forecast()
    { lat: lat, lng: lng, wind_speed: wind_speed, wind_bearing: wind_bearing, wind_direction: wind_direction }
  end


end