class LocomotiveEngineer
  def self.generate_list_of_wagons(*ids)
    ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    w1, w2, w3, *rest = each_wagons_id
    [w3, *missing_wagons, *rest, w1, w2]
  end

  def self.add_missing_stops(routing_hash, **kwargs)
    {**routing_hash, stops: kwargs.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
