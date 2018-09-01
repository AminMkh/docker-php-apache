# Laravel
artisan() {
  if [ -f bin/artisan ]; then
    php bin/artisan "$@"
  else
    php artisan "$@"
  fi
}

alias serve='artisan serve'
alias tinker='artisan tinker'

# Misc PHP
phpunit() {
  if [ -f vendor/bin/phpunit ]; then
    vendor/bin/phpunit "$@"
  else
    phpunit "$@"
  fi
}
#alias phpunit="phpunit --filter "

alias pa='php artisan'
alias par:l='php artisan route:list'
alias pam='php artisan migrate'
alias pam:r='php artisan migrate:refresh'
alias pam:rs='php artisan migrate:refresh --seed'
alias cu='composer update'
alias ci='composer install'
alias cda='composer dump-autoload -o'

alias permissions='chmod 777 -R storage/ bootstrap/cache'
alias composer='/usr/bin/composer -vvv'
