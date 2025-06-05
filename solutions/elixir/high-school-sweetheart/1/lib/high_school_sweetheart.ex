defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim_leading(name) |>
    String.at(0)
  end

  def initial(name) do
    first_letter(name) |>
    String.capitalize() |> 
    Kernel.<> "."
  end

  def initials(full_name) do
    String.split(full_name, " ") |>
    Enum.map(&initial/1) |>
    Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    initials1 = initials(full_name1)
    initials2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials1}  +  #{initials2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
