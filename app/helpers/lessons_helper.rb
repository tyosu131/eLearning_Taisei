module LessonsHelper
  def is_done(category)
    Lesson.find_by(category_id: category.id, user_id: current_user.id)
  end   

  def get_result(category)
    Lesson.find_by(category_id: category.id, user_id: current_user.id).result
  end
end
