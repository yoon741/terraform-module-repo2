# user-data 템플릿 코드를 외부에 노출

output "nginx_userdata" {
  value = data.template_file.nginx_userdata.rendered
}
