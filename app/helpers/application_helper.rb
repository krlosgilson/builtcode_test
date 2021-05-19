module ApplicationHelper

  def breadcrumbs crumbs={}
    html  = '<nav class="nav_custom">'
    html << '  <div class="nav-wrapper">'
    html << '    <div class="col s12">'
    html << '      <a href="/" class="breadcrumb breadcrumb_custom">Dashboard</a>'
    crumbs.map { |k,v| html << "<a href=\"#{v.nil? ? "#" : v}\" class=\"breadcrumb breadcrumb_custom\">#{k}</a>" }
    html << '    </div>'
    html << '  </div>'
    html << '</nav>'
    html.html_safe
  end

  def select_uf
    [
      "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", "MA", "MG", "MS", "MT", "PA",
      "PB", "PE", "PI", "PR", "RJ", "RN", "RO", "RR", "RS", "SC", "SE", "SP", "TO"
    ]
    .map{ |uf| [uf, uf] }
  end

  def date_br date
    date.strftime("%d/%m/%Y")
  end

  def time_br time
    time.strftime("%H:%M:%S")
  end

  def time_short_br time
    time.strftime("%H:%M")
  end

  def cpf_formatted cpf
    "#{cpf[0,3]}.#{cpf[3,3]}.#{cpf[6,3]}-#{cpf[9,2]}"
  end

end
