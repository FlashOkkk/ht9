# Базовий образ
FROM centos:9

# Встановлення Nginx
RUN yum update -y && yum install -y nginx && yum clean all

# Копіювання вмісту ./html до папки Nginx
COPY ./html /usr/share/nginx/html

# Відкриття порту
EXPOSE 80

# Запуск Nginx
CMD ["nginx", "-g", "daemon off;"]
