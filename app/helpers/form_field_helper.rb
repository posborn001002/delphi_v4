module FormFieldHelper
  def delphi_text_field( form, args={} )
    has_label = args[:label].present?
    has_icon = args[:icon].present?

    html=''
    if has_label
      html << "<label class=\"input-label\">#{args[:label]}</label>"
    end
    html << "<div class=\"input\">"
    html << form.text_field( args[:name],  aria: {required: 'true', describedby: 'address-error', invalid: 'true' }, class: "form_control" )
    if has_icon
      html << "<i class=\"d-none d-sm-block icon-append #{args[:icon]}\"></i>"
    end
    html << "</div>"

  return html.html_safe
  end

  def delphi_email_field(form, args={} )
    has_label = args[:label].present?

    html=''
    if has_label
      html << "<label class=\"input-label\">#{args[:label]}</label>"
    end
    html << "<div class=\"input\">"
    html << form.email_field( args[:name], class: "form_control" )
    html << "<i class=\"d-none d-sm-block icon-append fa fa-envelope\"></i>"
    html << "</div>"

    return html.html_safe
  end


  def delphi_phone_field( form, args={} )
    has_label = args[:label].present?

    html=''
    if has_label
      html << "<label class=\"input-label\">#{args[:label]}</label>"
    end
    html << "<div class=\"input\">"
    html << form.telephone_field( args[:name], class: "form_control" )
    html << "<i class=\"d-none d-sm-block icon-append fa fa-phone\"></i>"
    html << "</div>"

    return html.html_safe
  end

  def delphi_text_area( form, args={} )
    has_label = args[:label].present?

    html=''
    if has_label
      html << "<label class=\"input-label\">#{args[:label]}</label>"
    end
    html << "<div class=\"input\">"
    html << form.text_area( args[:name], class: "form_control" )
    html << "</div>"

    return html.html_safe
  end


  def delphi_date_field( form, args={} )
    has_label = args[:label].present?

    html=''
    if has_label
      html << "<label class=\"input-label\">#{args[:label]}</label>"
    end
    html << "<div class=\"input\">"
    html << form.date_field( args[:name], value: args[:value], class: "form_control" )
    html << "</div>"

    return html.html_safe
  end
end