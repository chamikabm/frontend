# Build Phase

# This as part will be the reference to next run phase.
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase
FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


