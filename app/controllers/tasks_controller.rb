class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  private
    def task_params
      params.require(:task).permit(:description)
    end
end
