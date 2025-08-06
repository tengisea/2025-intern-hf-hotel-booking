terraform {
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 0.3"
    }
  }
}

resource "vercel_project" "hotel-backend-prod" {
  name             = "hotel-backend-prod"
  build_command    = "nx build --skip-nx-cache hotel-backend"
  output_directory = "./dist/apps/hotelbooking/backend/.next"
  framework        = "nextjs"
  team_id          = "team_2TjV6297LA267czkNg94ORef"
}


resource "vercel_project" "hotel-backend-testing" {
  name             = "hotel-backend-testing"
  build_command    = "nx build --skip-nx-cache hotel-backend"
  output_directory = "./dist/apps/hotelbooking/backend/.next"
  framework        = "nextjs"
  team_id          = "team_2TjV6297LA267czkNg94ORef"
}



resource "vercel_project" "hotel-backend-development" {
  name             = "hotel-backend-development"
  build_command    = "nx build --skip-nx-cache hotel-backend"
  output_directory = "./dist/apps/hotelbooking/backend/.next"
  framework        = "nextjs"
  team_id          = "team_2TjV6297LA267czkNg94ORef"
}



variable "VERCEL_TOKEN" {
  type        = string
  description = "Optionally say something about this variable"
}

provider "vercel" {
  # Or omit this for the api_token to be read
  # from the VERCEL_API_TOKEN environment variable
  api_token = var.VERCEL_TOKEN

  # Optional default team for all resources
  team = "team_2TjV6297LA267czkNg94ORef"
}