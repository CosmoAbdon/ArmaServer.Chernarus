class CfgServerInfoMenu
{
   addAction = 0; // Enable/disable action menu item | use 0 to disable | default: 1 (enabled)
   antiHACK = "infiSTAR + BattlEye";
   hostedBy = "CRAZY TO KILL Servers";
   ipPort = "ARMA3.CLANC2K.COM.BR:2302";
   openKey = "User7"; // https://community.bistudio.com/wiki/inputAction/actions
   openAtLogin = no;
   restart = 3; // Amount of hours before server automatically restarts
   serverName = "C2K Wasteland Altis";
   class menuItems
   {
      // title AND content accept formatted text ( since update Oct5.2016 )
	  class first
      {
         menuName = "Regras";
         title = "Regras do Servidor";
         content[] = {
            "<t size='1.70'>Regras do Servidor <t color='#FFDE3B'>[C2K] Crazy to Kill</t></t><br />",
            "1 - Proibido qualquer prática de anti-jogo no ARMA3 Utilizando-se dos erros ou bugs do servidor ou do próprio jogo para atravessar paredes, pedras ou quaisquer outros obstáculos, de fora para dentro e vice-versa de construções: 1º Ban temporário <t color='#FF0000'>2º Ban permanente</t><br />",
			"2 - Proibido uso de hacks:<t color='#FF0000'>1º Ban permanente.</t><br />",
            "3 - Não reclame excessivamente de lag no chat do jogo: 1º aviso verbal, 2º kick <t color='#FF0000'>3º Ban permanente.</t><br />",
			"4 - Caso seja banido, entrar no Fórum e encontrar o tópico de seu banimento e recorrer (se for cabível).<br />",	
            "5 - Proibido xingamento ao servidor, e tudo que representar C2K: 1º kick <t color='#FF0000'>2º Ban permanente.</t><br />",
			"6 - O Clan C2K se reserva ao direito de alterar parcial ou totalmente estas regras sem qualquer aviso prévio. Caso seja necessário, os usuários serão avisados por meio deste fórum<br />",
            "7 - <t color='#FF0000'>Obs:</t>Se caso a Administração não estiver presente no servidor no momento, as seguintes aplicações; 1º e 2º (aviso e kick respectivamente), automaticamente irão se voltar à 3º aplicação (Ban) em casos avulsos e denúncias cabendo ao administrador decidir livremente pela duração (se temporário ou permanente).<br />"

			
         };
      };
      class second
      {
         menuName = "Missões";
         title = "<t color='#ffffff'>Missões do Servidor</t>";
         content[] = {
            "<br/>• Small Money Shipment: $150,000<br />• Medium Money Shipment: $175,000<br />• Large Money Shipment: $200,000<br />• Heavy Money Shipment: $350,000<br />• Sunken Treasure: $200,000<br />• Anonymous Hackers: $250000, $300000, $350000, $400000, $450000, $500000, $700000, $800000, $1000000<br /></p>"
         };
      };
      class third
      {
         menuName = "Eventos";
         title = "Eventos todo fim de semana";
         content[] = {"<t size='1.75'>Próximo Evento</t><br />• NÃO DISPONIVEL<<br />"};
      };
      class fourth
      {
         menuName = "Admins";
         title = "ADMINISTRADORES";
         content[] = {"<t size='1.75'>ADMIN</t><br /><t color='#0091CD'>• C2K_FliCK <br/ >• C2K_ThiagoTnn <br />• C2K_Gpezzini</t><br />",
            "<t size='1.75'>EDITOR</t><br /><t color='#0091CD'>• Rocha<br />• C2K_FliCK </t/><<br />"};
      };
      class fifth
      {
         menuName = "Rank";
         title = "TOP 10";
         content[] = {"<t size='1.75'>Rank</t><br />• EM BREVE<<br />"};
      };
      class sixth
      {
         menuName = "Comunicação";
         title = "SERVIDOR DE VOZ E WEBSITE"; 
         content[] = {
            "Website: <t color='#0091CD'><a href='http://www.clanc2k.com.br'>CLANC2K.COM.BR</a></t><br/>Facebook: <t color='#0091CD'><a href='https://www.facebook.com/crazytokill'>www.facebook.com/crazytokill</a></t><br/>Youtube: <t color='#0091CD'><a href='https://www.youtube.com/user/oficialclanc2k'>www.youtube.com/user/oficialclanc2k</a></t><br/>Whatsapp: <t color='#0091CD'><a href='https://chat.whatsapp.com/LPoq4LSqIM23ynYaUB8dg1'> (219) 8401-5699 </a></t> <br/>TeamSpeak: <t color='#0091CD'><a href='http://invite.teamspeak.com/ts3.clanc2k.com.br/?port=9987'>ts3.clanc2k.com.br<br/></a></t>"
         };
      };
      class seventh
      {
         menuName = "Atualizações";
         title = "GitHub do C2K";
         content[] = {
            "GitHub: <t color='#0091CD'><a href='https://github.com/C2KA3/WastelandC2K/commits/master'>github.com/C2KA3/WastelandC2K<br/></a></t>"
         };
      };
   };
};
