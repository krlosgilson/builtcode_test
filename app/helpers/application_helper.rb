module ApplicationHelper

  def breadcrumbs crumbs={}
    html  = '<nav>'
    html << '  <div class="nav-wrapper">'
    html << '    <div class="col s12">'
    html << '      <a href="/" class="breadcrumb">&nbsp;Dashboard</a>'
    crumbs.map { |k,v| html << "<a href='#{v.nil? ? '#!' : v}' class='breadcrumb'>#{k}</a>" }
    html << '    </div>'
    html << '  </div>'
    html << '</nav>'
    html.html_safe
  end

  def link_to_new href
    link_to '<i class="material-icons">add</i>'.html_safe, href,
    class: 'waves-effect waves-light btn-floating btn-floating-custom', title: 'Novo'
  end

  def link_to_edit href
    link_to '<i class="material-icons left">edit</i>Editar'.html_safe, href,
    class: 'waves-effect waves-light btn-flat btn', title: 'Editar'
  end

  def link_to_back href
    link_to '<i class="material-icons left">arrow_back_ios</i>Voltar'.html_safe, href,
    class: 'waves-effect waves-light btn-flat btn'
  end

  def button_to_submit
    html = <<-HTML
      <button name="commit" type="submit" class="waves-effect waves-light btn">
        <i class="material-icons left">save</i>Salvar
      </button>
    HTML
    html.html_safe
  end

  def show_form_errors obj
    if obj.errors.any?
      html  = '<blockquote class="red-text">'
      html << "  <h5>#{ pluralize(obj.errors.count, 'error') } ao tentar salvar:</h5>"
      html << '  <ul>'
      obj.errors.each do |error|
        html << "  <li>#{ error.full_message }</li>"
      end
      html << '  </ul>'
      html << '</blockquote>'
      html.html_safe
    end
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
