module InputHelper
  def valide_choice?(input)
    if input == ' '
      false

    elsif input == ''

    elsif !input.between?(1, 3)

      false

    else
      true
    end
  end

  def valide_choice_music?(input)
    if input == ' '
      false

    elsif input == ''

    elsif !input.between?(0, 11)

      false

    else
      true
    end
  end
end
