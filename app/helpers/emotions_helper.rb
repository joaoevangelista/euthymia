module EmotionsHelper

  def percentage_of(number)
    number * 100
  end

  def joy(joy_rate)
    "#{image_tag 'emotions/joy.svg', height: 35}
    &nbsp;
    <span>Joy</span>
    <progress class='space progress progress-striped progress-animated progress-success'
     value='#{percentage_of joy_rate}' max='100'>#{percentage_of joy_rate}%</progress>"
     .html_safe
  end

  def surprise(surprise_rate)
    "#{image_tag 'emotions/surprise.svg', height: 35}
    &nbsp;
    <span>Surprise</span>
    <progress class='space progress progress-striped progress-animated progress-info'
     value='#{percentage_of surprise_rate}' max='100'>#{percentage_of surprise_rate}%</progress>"
     .html_safe
  end

  def sadness(sadness_rate)
    "#{image_tag 'emotions/sad.svg', height: 35}
    &nbsp;
    <span>Sadness</span>
    <progress class='space progress progress-striped progress-animated progress-warning'
     value='#{percentage_of sadness_rate}' max='100'>#{percentage_of sadness_rate}%</progress>"
     .html_safe
  end

  def anger(anger_rate)
    "#{image_tag 'emotions/anger.svg', height: 35}
    &nbsp;
    <span>Anger</span>
    <progress class='space progress progress-striped progress-animated progress-danger'
     value='#{percentage_of anger_rate}' max='100'>#{percentage_of anger_rate}%</progress>"
     .html_safe
  end

  def fear(fear_rate)
    "#{image_tag 'emotions/fear.svg', height: 35}
    &nbsp;
    <span>Fear</span>
    <progress class='space progress progress-striped progress-animated progress-alternative'
     value='#{percentage_of fear_rate}' max='100'>#{percentage_of fear_rate}%</progress>"
     .html_safe
  end
end
