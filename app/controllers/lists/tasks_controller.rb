class Lists::TasksController < ApplicationController
  resond_to :html, :js

  def show
    current_user?
    @list = List.find(params[:list_id])
    @tasks = @list.tasks
    authorize @list
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
    authorize @list
  end

  def create
    @list = List.find(params[:topic_id])
    @task = current_user.tasks.build(params[:id])
    @task.list = @list
    authorize @task

    if @task.save
      flash[:notice] = "Task was saved."
      redirect_to [@list, @task]
    else
      flash:[:error] = "There was an error saving the task. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    authorize @task
  end
end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    authorize @task

    if @task.update
      flash[:notice] = "Task was updated."
      redirect_to [@list, @task]

    else
      flash[:error] = "There was an error saving the task. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:topic_id])
    @task = Task.find(params[:id])
    body = @task.body
    authorize @task

    if @task.destroy
      flash[:notice] = "\"#{body}\" was deleted successfully."
      redirect_to @list
    else
      flash[:error] = "There was an error deleting the task."
      render :show
    end
  end
