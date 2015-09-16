# Secure PHP Sessions
Secure and scalable sessions in PHP and Redis, based on this SitePoint [article](http://www.sitepoint.com/saving-php-sessions-in-redis), making use of [Predis](https://github.com/nrk/predis).

## Requirements

- A HTTP Server (e.g. Apache, Nginx)
- PHP5+ (PHP5-FPM, if using Nginx)
- Redis (setup.sh script will check if installed, if not, setup.sh will handle the installation)
- [Composer](https://getcomposer.org)

## Installation

Change directory to the secure-php-sessions directory (the location where you checked out the project to), then run the following commands:

NOTE: The setup script only supports Ubuntu, CentOS and Fedora operating systems. Alternatively, you can install Redis manually by following the installation instructions [here](http://redis.io/topics/quickstart) and install Predis using [Composer](https://getcomposer.org).

```
cd setup
sudo chmod a+x setup.sh
sudo ./setup.sh
```