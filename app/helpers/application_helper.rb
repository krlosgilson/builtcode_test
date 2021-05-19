module ApplicationHelper

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
