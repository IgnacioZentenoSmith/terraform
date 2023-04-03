module "instance1" {
  # source to the main.tf
  source = "./modules/instance1"
  #param1  = value
  #param2  = value
  #param3  = value
}

module "instance2" {
  source = "./modules/instance2"
  version = "0.0.5"
  #param1  = value
  #param2  = value
  #param3  = value
}


module "instance3" {
  source = "./modules/instance3"
  #param1  = value
  #param2  = value
  #param3  = value
}

