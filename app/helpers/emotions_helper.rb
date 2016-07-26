# frozen_string_literal: true
# Rendering helper for emotion progresses
module EmotionsHelper
  def percentage_of(number)
    number * 100
  end

  def joy(joy_rate)
    "#{image_tag 'emotions/joy.svg', height: 35}
    &nbsp;
    <span>#{I18n.t('helpers.emotions.joy')}</span>
    <progress class='space progress progress-striped progress-animated progress-success'
     value='#{percentage_of joy_rate}' max='100'>#{percentage_of joy_rate}%</progress>"
      .html_safe
  end

  def surprise(surprise_rate)
    "#{image_tag 'emotions/surprise.svg', height: 35}
    &nbsp;
    <span>#{I18n.t('helpers.emotions.surprise')}</span>
    <progress class='space progress progress-striped progress-animated progress-info'
     value='#{percentage_of surprise_rate}' max='100'>#{percentage_of surprise_rate}%
     </progress>"
      .html_safe
  end

  def sadness(sadness_rate)
    "#{image_tag 'emotions/sad.svg', height: 35}
    &nbsp;
    <span>#{I18n.t('helpers.emotions.sadness')}</span>
    <progress class='space progress progress-striped progress-animated progress-warning'
     value='#{percentage_of sadness_rate}' max='100'>#{percentage_of sadness_rate}%</progress>"
      .html_safe
  end

  def anger(anger_rate)
    "#{image_tag 'emotions/anger.svg', height: 35}
    &nbsp;
    <span>#{I18n.t('helpers.emotions.anger')}</span>
    <progress class='space progress progress-striped progress-animated progress-danger'
     value='#{percentage_of anger_rate}' max='100'>#{percentage_of anger_rate}%</progress>"
      .html_safe
  end

  def fear(fear_rate)
    "#{image_tag 'emotions/fear.svg', height: 35}
    &nbsp;
    <span>#{I18n.t('helpers.emotions.fear')}</span>
    <progress class='space progress progress-striped progress-animated progress-alternative'
     value='#{percentage_of fear_rate}' max='100'>#{percentage_of fear_rate}%</progress>"
      .html_safe
  end
end
