class CheckoutsController < ApplicationController
  before_action :set_order_items, only: [:new, :create]
  before_action :set_checkout, only: [:show, :edit, :update, :destroy]
  before_action :ensure_cart_isnt_empty, only: [:create, :new]
  before_action :check_admin, except: [:new, :create]


  # GET /checkouts
  # GET /checkouts.json
  def index
    @checkouts = Checkout.all
  end

  # GET /checkouts/1
  # GET /checkouts/1.json
  def show
  end

  # GET /checkouts/new
  def new
    @checkout = Checkout.new
  end

  # GET /checkouts/1/edit
  def edit
  end

  # POST /checkouts
  # POST /checkouts.json
  def create
    @checkout = Checkout.new(checkout_params)
    @checkout.add_order_items_from_cart(current_order)
    respond_to do |format|
      if @checkout.save
        Order.destroy(session[:order_id])
        session[:order_id] = nil
        format.html { redirect_to root_path, notice: 'Thanks for you order!' }
        format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkouts/1
  # PATCH/PUT /checkouts/1.json
  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { redirect_to @checkout, notice: 'Checkout was successfully updated.' }
        format.json { render :show, status: :ok, location: @checkout }
      else
        format.html { render :edit }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkouts/1
  # DELETE /checkouts/1.json
  def destroy
    @checkout.destroy
    respond_to do |format|
      format.html { redirect_to checkouts_url, notice: 'Checkout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkout
      @checkout = Checkout.find(params[:id])

    end
    def set_order_items
      @order_items = current_order.order_items

    end

    # Only allow a list of trusted parameters through.
    def checkout_params
      params.require(:checkout).permit(:first_name, :last_name, :address, :city, :country, :postal_code, :phone, :pay_type)
    end

    def ensure_cart_isnt_empty
      if current_order.order_items.empty?
        redirect_to root_path, notice: "You cart is empty."
      end
    end
end
