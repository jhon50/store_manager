class Admin::GoalsController < Admin::ApplicationController
  before_action :set_admin_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_store
  before_action :any_vendors?, only: :new
  around_action :rescue_exceptions, only: :create

  # GET /admin/goals
  def index
    @goals = Goal.where(store_id: @store)
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
      redirect_to new_admin_store_goal_day_path(goal_id: @goal)
    else
      render 'new'
    end
  end

  # PATCH/PUT /admin/goals/1
  def update
    if @goal.update(admin_goal_params)
      redirect_to admin_store_goals_path(store_id: admin_goal_params[:store_id]), notice: 'goal was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /admin/goals/1
  def destroy
    @goal.destroy
    redirect_to admin_store_goals_path, notice: 'goal was successfully destroyed.'
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

  def any_vendors?
    flash[:notice] = 'Você precisa ter vendedores cadastrados antes de adicionar uma meta.'
    redirect_to new_admin_vendor_path(store_id: @store) unless Store.find(@store).vendors.any?
  end

  def rescue_exceptions
    yield
  rescue Goal::DayAlreadyExistError => e
    @goal.errors.add(:start_date, e)
    render 'new'
  rescue StandardError => e
    render 'new'
  end
end
