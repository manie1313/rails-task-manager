class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # raise
    # one task per id so convention name @task sg and not plr
    @task = Task.find(params[:id])
    # we can have access to the id because the url path has the id in it task/id
  end

  def new
    @task = Task.new
  end

  def create
    # raise
    @task = Task.new(task_params)
    @task.save
    # redirect to show url page where with the new instance of a task
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # redirect to show url page where with the new instance of a task
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # redirect to show url page where with the new instance of a task
    redirect_to tasks_path(@task), status: :see_other
    # path of the index to see that it doesn t exist anymore
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end


end
