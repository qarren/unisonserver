class CodeScoresController < ApplicationController

  before_filter :require_admin, only: [:create, :update, :destroy, :csv]

  def index
    @codescores = CodeScore.all
    render json: @codescores
  end

  def show
    @codescore = CodeScore.find(params[:id])
    render json: @codescore
  end

  def new
    @codescore = CodeScore.new
    render json: @codescore
  end

  def create
    @codescore = CodeScore.create(params[:codescore])

    if @codescore.save
      render json: @codescore, status: :created, location: @codescore
    else
      render json: @codescore.errors, status: :failed
    end
  end

  def update
    @codescore = CodeScore.find(params[:id])

    if @codescore.update_attributes(params[:codescore])
      render json: @codescore, location: @codescore
    else
      render json: @codescore.errors, status: :failed
    end
  end

  def delete
    @codescore = CodeScore.find(params[:id])

    if @codescore.destroy
      render json: @codescore
    else
      render json: @codescore.errors, status: :failed
    end
  end

end

