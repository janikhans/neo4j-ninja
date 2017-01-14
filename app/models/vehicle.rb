class Vehicle < ApplicationRecord
  belongs_to :vehicle_submodel
  belongs_to :vehicle_year
  has_many :fitments
  has_many :oem_parts, through: :fitments, source: :part

  def self.find_with_specs(brand, model, year, submodel = nil)
    _brand = Brand.where('lower(name) = ?', brand.downcase).first
    return nil unless _brand
    _model = _brand.vehicle_models.where('lower(name) = ?', model.downcase).first
    return nil unless _model
    if submodel
      _submodel = _model.vehicle_submodels.where('lower(name) = ?', submodel.downcase).first
    else
      _submodel = _model.vehicle_submodels.where(name: nil).first
    end
    return nil unless _submodel
    _year = VehicleYear.find_by(year: year)
    return nil unless _year
    _submodel.vehicles.where(vehicle_year_id: _year.id).first
  end

  def year
    vehicle_year.year.to_s
  end

  def brand
    vehicle_submodel.vehicle_model.brand
  end

  def model
    vehicle_submodel.vehicle_model
  end

  def submodel
    vehicle_submodel
  end

  def type
    vehicle_submodel.vehicle_model.vehicle_type
  end

  def submodel_name
    vehicle_submodel.try(:name)
  end

  def to_label
    if submodel_name
      "#{year} #{brand_name} #{model_name} #{submodel_name}"
    else
      "#{year} #{brand_name} #{model_name}"
    end
  end
end
