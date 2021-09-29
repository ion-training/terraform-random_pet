resource "random_pet" "dog" {
    # String can start with defined characters
  prefix = "Mr"
  # between the strings add an underscore
  separator = "_"
  # generate 2 strings (prefix taken into account) that will be conctacted by underscore
  length = 2
}
