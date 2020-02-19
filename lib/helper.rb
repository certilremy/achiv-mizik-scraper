module InputHelper

  def conver(choice)
    choice.to_i - 1
  end

  def valide_choice(input)
    if input == ' '
      false

    elsif input == ''

    elsif !input.between?(1, 10)

      false

    else
      true
    end
  end
end
