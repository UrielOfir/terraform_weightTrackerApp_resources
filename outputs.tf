output "passwords" {
    description= "The passwords to connect the virtual machines"
    value = {
        DBuserName= var.DB-VMUserName
        DBpassword= var.DB-VMPassword
        webAppUserName= var.webAppVMUserName
        webAppPassword= var.webAppVMPassword
    }
}