class Admin::GoalsController < Admin::ApplicationController
  before_action :set_admin_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_store
  # GET /admin/goals
  def index
    @goals = Goal.where(store: @store)
  end

  # GET /admin/goals/1
  def show
  end

  # GET /admin/goals/new
  def new
    @goal = Goal.new(store_id: @store)
  end

  # GET /admin/goals/1/edit
  def edit
  end

  # POST /admin/goals
  def create
    @goal = Goal.new(admin_goal_params)
    if @goal.save
      # redirect to
      redirect_to admin_store_goals_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /admin/goals/1
  def update
    if @goal.update(admin_goal_params)
      redirect_to admin_goals_path, notice: 'goal was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /admin/goals/1
  def destroy
    @goal.destroy
    redirect_to admin_goals_path, notice: 'goal was successfully destroyed.'
  end

  private
    def set_admin_goal
      @goal = Goal.find(params[:id])
    end

    def set_store
      @store = params[:store_id]
    end

    def admin_goal_params
      params.require(:goal).permit(:start_date, :end_date, :ref_month, :amount, :store_id)
    end
end
