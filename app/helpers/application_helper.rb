module ApplicationHelper
  
  def human_readable_box_type package_type
    box_type_hum = {"JAR"=>'Jar', "DB" => 'Dress Box', "SLB" => 'Slide Lid Box', "SBN" => 'Semi Boîte Nature', "CB" => 'Cardboard Pack', "BLBN" => 'Black Lacquered Boîte Nature', "VBN" => 'Varnished Boîte Nature', "VSBN" => 'Varnished Semi Boîte Nature', "VSLB" => 'Varnished Slid Lid Box', "NVBN" => 'Numbered Varnished Boîte Nature', "NSLB" => 'Numbered Slide Lid Box', "NSBN" => 'Numbered Semi Boîte Nature', "V898" => 'Varnished 8-9-8', "CBB" => 'Cardboard Box', "NDB" => 'Numbered Dress Box', "TH" => 'Travel Humidor', "SB" => 'Seleccion Box', "MT" => 'Metal Tin', "MP" => 'Metal Tin', "TP3IT" => '3 cigars in humidified tubes', "RCBB"=> 'Rigid Cardboard Box', "RBB" => 'Rigid Cardboard Box'}
    box_type_hum[package_type]||package_type
  end
  def human_readable_box_type_2 package_type
    
    case package_type
      when "DB"
        'Dress Box'
      when "SLB"
        'Slide Lid Box'
      when "SBN"
        'Semi Boîte Nature'
      when "CB"
        'Cardboard Pack'
      when "BLBN"
        'Black Lacquered Boîte Nature'
      when "VBN"
        'Varnished Boîte Nature'
      when "VSBN"
        'Varnished Semi Boîte Nature'
      when "VSLB"
        'Varnished Slid Lid Box'
      when "NVBN"
        'Numbered Varnished Boîte Nature'
      when "NSLB"
        'Numbered Slide Lid Box'
      when "NSBN"
        'Numbered Semi Boîte Nature'
      when "V898"
        'Varnished 8-9-8'
      when "CBB"
        'Cardboard Box'
      when "NDB"
        'Numbered Dress Box'
      when "TH"
        'Travel Humidor'
      when "SB"
        'Seleccion Box'
      when "MT", "MP"
        'Metal Tin'
      when "TP3IT"
        '3 cigars in humidified tubes'
      when "RBB"
        'Rigid Cardboard Box'
      else
        package_type
    end
  end
end