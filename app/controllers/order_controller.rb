def move_to_index
  return if user_signed_in?

  redirect_to action: :index
end
