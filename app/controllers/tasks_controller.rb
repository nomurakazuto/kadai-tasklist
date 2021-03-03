class TasksController < ApplicationController
    before_action :set_task, only: [:edit, :show, :destroy, :update]
    before_action :require_user_logged_in?, only: [:index]
    def index
        @tasks = current_user.tasks
    end
    
    def show
       
    end
    
    def new
        @task = current_user.tasks.build
    end
    
    def create
        @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = "タスクを追加しました。"
            redirect_to @task 
        else
            flash.now[:danger] = "タスクを追加できませんでした"
            render :new
        end
    end
    
    def edit
       
    end
    
    def update
        
        if @task.update(task_params)
            flash[:success] = "Taskは正常に更新されました。"
            redirect_to @task
        else
            flash.now[:danger] = "Taskは更新されませんでした"
            render :edit
        end
    end
    
    
    def destroy
       
        @task.destroy
        
        flash[:success] = "Taskは正常に削除されました"
        redirect_to tasks_url
    end
    
    private
    def set_task
      @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
    private
    
end
