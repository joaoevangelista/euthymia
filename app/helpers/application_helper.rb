# frozen_string_literal: true
# :nodoc:
module ApplicationHelper
  def update_time_of(entity)
    return '' unless entity || entity.updated_at
    entity.updated_at.strftime('%b %d, %Y - %H:%M')
  end

  def created_time_of(entity)
    return '' unless entity || entity.created_at
    entity.created_at.strftime('%b %d, %Y - %H:%M')
  end

  def short_text(text)
    return '' unless text
    if text.length > 140
      text[0...140].concat('...')
    else
      text
    end
  end

  # Render a gravatar url based on the user's email
  def gravatar(email, size = 50)
    hash = Digest::MD5::hexdigest email
    "https://gravatar.com/avatar/#{hash}.png?s=#{size}"
  end

  def back_link(href)
    link_to mdi('chevron-left'), href, class: 'navbar-brand text-orange'
  end

  def create_entry_nav_link(journal)
    "<li>
    #{link_to I18n.t('helpers.application.new_entry'), new_journal_entry_path(journal), class: 'dropdown-item'}
    </li>".html_safe
  end

  def delete_link(text, href, options = {})
    link_to text, href, method: :delete, data: {
      confirm: I18n.t('helpers.application.delete_link.confirm'),
      confirm_title: I18n.t('helpers.application.delete_link.confirm_title'),
      confirm_fade: true,
      confirm_cancel: I18n.t('helpers.application.delete_link.confirm_cancel'),
      confirm_proceed: I18n.t('helpers.application.delete_link.confirm_proceed'),
      confirm_cancel_class: 'btn btn-secondary',
      confirm_proceed_class: 'btn btn-orange'
    }, class: options[:class]
  end

  def mdi(name, text = '', options = {})
    "<i class='mdi mdi-#{name} #{options[:class]}'></i> #{text}".html_safe
  end

  def mdi_on_end(name, text = '', options = {})
    "#{text} <i class='mdi mdi-#{name} #{options[:class]}'></i>".html_safe
  end
end
