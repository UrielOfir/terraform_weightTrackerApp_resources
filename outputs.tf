output "passwords" {
    value = {
        DBuserName= var.DB-VMUserName
        DBpassword= var.DB-VMPassword
        webAppUserName= var.webAppVMUserName
        webAppPassword= var.webAppVMPassword
    }
}