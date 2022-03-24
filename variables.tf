variable "webAppPrefix" {
  description = "The prefix which should be used for all resources connected to the web app."
  default     = "WA"
}

variable "DBPrefix" {
  description = "The prefix which should be used for all resources connected to the database."
  default     = "DB"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default     = "eastus"
}

variable "appPort" {
  description = "The port on which the web app should be listening."
  default     = 8080
}
