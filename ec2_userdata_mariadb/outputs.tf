# user-data 템플릿 코드를 외부에 노출

output "mariadb_userdata" {
  value = data.template_file.mariadb_userdata.rendered
}
