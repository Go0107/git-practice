while true; do
	echo "パスワードマネージャーへようこそ："
	echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
	
	read choose
	
	
	case $choose in
		"Add password")
			echo "サービス名を入力してください："
			read service_name

			echo "ユーザー名を入力してください："
			read user_name

			echo "パスワードを入力してください："
			read password

			echo "$service_name:$user_name:$password" >> password.txt
			echo "パスワードの追加は成功しました。"
			echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
			;;
		"Get Password")
			echo "サービス名を入力してください："
			read service_name

			password=$(grep "^service_name:" password.txt | cut -d: -f3)

			if [ -z "$password" ]; then
				echo "そのサービスは登録されてません。"
			else
				echo "サービス名：$service_name"
				echo "ユーザー名：$(grep "^service_name:" password.txt | cut -d: -f2)"
				echo "パスワード：$password"
			fi
			;;
		"Exit")
			echo "Thank you!"
			exit
			;;

		*)
			echo "入力が間違えています。Add Password/Get Password/Exitから入力してください。"
			;;
	esac		
done

