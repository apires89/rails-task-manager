class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(params[:tasks])
    @tasks.save
    redirect_to task_path(@task)
  end

  def edit
    @tasks = Task.find(params[:id])
    @tasks.edit(params[:tasks])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update(params[task_params])
    redirect_to task_path(@task)
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to task_path
  end
end

private

def task_params
  params.require(:task).permit(:name,:done)

end
