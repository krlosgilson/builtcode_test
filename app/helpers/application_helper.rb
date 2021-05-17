module ApplicationHelper

  def select_uf
    [
      ["AC","AC"],["AL","AL"],["AM","AM"],["AP","AP"],["BA","BA"],["CE","CE"],["DF","DF"],["ES","ES"],["GO","GO"],
      ["MA","MA"],["MG","MG"],["MS","MS"],["MT","MT"],["PA","PA"],["PB","PB"],["PE","PE"],["PI","PI"],["PR","PR"],
      ["RJ","RJ"],["RN","RN"],["RO","RO"],["RR","RR"],["RS","RS"],["SC","SC"],["SE","SE"],["SP","SP"],["TO","TO"]
    ]
  end

  def date_br date
    date.strftime("%d/%m/%Y")
  end

  def time_br time
    time.strftime("%H:%M:%S")
  end

  def cpf_formated cpf
    "#{cpf[0,3]}.#{cpf[3,3]}.#{cpf[6,3]}-#{cpf[9,2]}"
  end

end
