#----------------------------#
#Build those brands

brands = ["Acerbis", "Hinson", "Tusk Racing", "ARC", "Barnett", "Yamaha", "Kawasaki", "KTM", "Beta", "FORD", "Chevrolet", "Husqvarna", "Honda"]
brands.each do |name|
  Brand.create(name: name)
end

#----------------------------#
#Build those Vehicle Types

types = ["Motorcycle", "ATV/UTV", "Snowmobile", "Scooter", "Car", "Personal Watercraft", "Truck", "Golf Cart"]
types.each do |name|
  VehicleType.create(name: name)
end

#----------------------------#
# Build the VehicleYears

years = (1990..Date.today.year+1).to_a
years.each do |year|
  VehicleYear.create(year: year)
end

#----------------------------#
#Categories

categories = ["Bearings", "Body", "Brakes", "Cooling Systems", "Drive", "Electrical", "Engine", "Exhaust", "Filters", "Fuel System", "Air Intake System", "Controls", "Suspension", "Wheels"]
categories.each do |name|
  Category.create(name: name)
end

bearings_sub = ["Crankshaft Bearings", "Shock Bearings", "Shock Linkage Bearings", "Steering Stem Beerings", "Swing Arm Bearings", "Wheel Bearings"]
engine_sub = ["Clutch", "Camshafts", "Pistons", "Cluch Cover"]
wheel_sub = ["Complete Wheel Assembly", "Rims", "Hubs", "Spokes", "Wheel Spacers"]

bearing = Category.first
engine = Category.find(7)
wheel = Category.last

bearings_sub.each do |name|
  Category.create(name: name, parent_category: bearing)
end
engine_sub.each do |name|
  Category.create(name: name, parent_category: engine)
end
wheel_sub.each do |name|
  Category.create(name: name, parent_category: wheel)
end

#----------------------------#
#Part attributes

["Rim Size", "Color"].each do |name|
  PartAttribute.create(name: name)
end

color_variations = ["Black", "Red"]
rim_size_variations = ["19", "21", "18"]

color_variations.each do |name|
  PartAttribute.create(name: name, parent: PartAttribute.find_by(name: "Color"))
end
rim_size_variations.each do |name|
  PartAttribute.create(name: name, parent: PartAttribute.find_by(name: "Rim Size"))
end

#----------------------------#
# Fitment Notes

["Location", "Quantity"].each do |name|
  FitmentNote.create(name: name)
end

location_variations = ["Front", "Rear"]
quantity_variations = ["1", "2", "4"]

location_variations.each do |name|
  FitmentNote.create(name: name, parent: FitmentNote.find_by(name: "Location"))
end
quantity_variations.each do |name|
  FitmentNote.create(name: name, parent: FitmentNote.find_by(name: "Quantity"))
end

#----------------------------#
# VehicleModels/ VehicleSubmodels / Vehicles

yz250 = VehicleForm.new(model: "YZ250", year: 2006, brand: "Yamaha", type: "Motorcycle").save
yz25004 = VehicleForm.new(model: "YZ250", year: 2004, brand: "Yamaha", type: "Motorcycle").save
yz25008 = VehicleForm.new(model: "YZ250", year: 2008, brand: "Yamaha", type: "Motorcycle").save
yz125 = VehicleForm.new(model: "YZ125", year: 2005, brand: "Yamaha", type: "Motorcycle").save
wr450 = VehicleForm.new(model: "WR450", year: 2012, brand: "Yamaha", type: "Motorcycle").save
wr426 = VehicleForm.new(model: "WR426", year: 2002, brand: "Yamaha", type: "Motorcycle").save
yz250f = VehicleForm.new(model: "YZ250F", year: 2011, brand: "Yamaha", type: "Motorcycle").save
wr250 = VehicleForm.new(model: "WR250", year: 2009, brand: "Yamaha", type: "Motorcycle").save
rmz450 = VehicleForm.new(model: "RMZ450", year: 2008, brand: "Suzuki", type: "Motorcycle").save
tm250 = VehicleForm.new(model: "250MX", year: 2011, brand: "TM Racing", type: "Motorcycle").save
yz450f = VehicleForm.new(model: "YZ450F", year: 2006, brand: "Yamaha", type: "Motorcycle").save
yz25005 = VehicleForm.new(model: "YZ250", year: 2005, brand: "Yamaha", type: "Motorcycle").save
yz450f11 = VehicleForm.new(model: "YZ450F", year: 2011, brand: "Yamaha", type: "Motorcycle").save
f150 = VehicleForm.new(model: "F150", year: 1994, brand: "ford", submodel: "lariat", type: "Truck").save
silverado = VehicleForm.new(model: "2500", year: 2000, brand: "chevroLET", submodel: "King Ranch", type: "Truck").save

#----------------------------#
# Parts / Products / Fitments
part1 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwyz25006", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: yz250, attributes: [{parent_attribute: "Color", attribute: "Silver"}, {parent_attribute: "Rim Size", attribute: "21"}]).save
part2 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwyz25004", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: yz25004, attributes: [{parent_attribute: "Color", attribute: "Silver"}]).save
part3 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwyz25008", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: yz25008, attributes: [{parent_attribute: "Color", attribute: "Black"}]).save
part4 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwyz12505", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: yz125, attributes: [{parent_attribute: "Rim Size", attribute: "21"}]).save
part5 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwwr45012", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: wr450).save
part6 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwwr42602", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: wr426).save
part7 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwyz250F11", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: yz250f, attributes: [{parent_attribute: "Color", attribute: "Black"}]).save
part8 = PartForm.new(brand: "Yamaha", product_name: "OEM Wheel Kit", part_number: "fwwr25009", root_category: "Wheels", category: "Complete Wheel Assembly", vehicle: wr250, attributes: [{parent_attribute: "Color", attribute: "Blue"}]).save
part9 = PartForm.new(brand: "Acerbis", product_name: "Chain Guide v1.0", part_number: "217909", root_category: "Body", category: "Chain Guides", vehicle: rmz450, attributes: [{parent_attribute: "Color", attribute: "Yellow"}]).save

#----------------------------#
# Other

Fitment.update_all(source: 1)
Fitment.find_by(vehicle: yz250, part: part1).fitment_notations.create(fitment_note: FitmentNote.find_by(name: "Front"))
Fitment.find_by(vehicle: yz25004, part: part2).fitment_notations.create(fitment_note: FitmentNote.find_by(name: "Front"))
Fitment.find_by(vehicle: yz25008, part: part3).fitment_notations.create(fitment_note: FitmentNote.find_by(name: "Front"))
