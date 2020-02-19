module InputHelper
  def converted(choice)
    choice - 1
  end

  def valide_choice(input)
    if input == ' '
      false

    elsif input == ''

    elsif !input.between?(1, 20)

      false

    else
      true
    end
  end
end
