class StoresController < ApplicationController
  before_filter :authenticate_user_from_token!, except: [:index, :show]
  before_filter :verify_user_is_admin!, except: [:index, :show]
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
    render :json => @stores
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find(params[:id])
    render :json => @store
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :json => @store, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :json => @store, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address_1, :address_2, :city, :state, :zipcode, :phone, :url)
    end

end
