#!/usr/bin/expect

# Pega o primeiro argumento - origem
set sour [lrange $argv 0 0]

# Pega o segundo argumento - destino
set dest [lrange $argv 1 1]

# Pega o terceiro argumento - usuário
set user [lrange $argv 2 2]

# Pega o quarto argumento - local de save
set save [lrange $argv 3 3]

# Pega o quinto argumento - IP
set ip [lrange $argv 4 4]

# Pega o quinto argumento - senha
set senha [lrange $argv 5 5]

# Pega o sexto argumento - porta
set porta [lrange $argv 6 6]

# Pega o sétimo argumento - arquivo
set arq [lrange $argv 7 7]

spawn scp -P $porta $sour $user@$ip:$dest

expect "password"
send "$senha\r"

expect eof 

spawn ssh $user@$ip -p $porta

expect "password" {
        send "$senha\r"

        expect "\*\$ " {
                send "sudo su\r"
                expect "\*password for $user:" {
                        send "$senha\r"

                        expect "\*#" {
                                send "cp $dest$arq $save\r"
                          send "exit\r"
                        }

                }

        }
        send "exit\r"
interact
}
