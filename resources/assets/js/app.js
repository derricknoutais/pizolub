

require('./bootstrap');

window.Vue = require('vue');

import Notifications from 'vue-notification'
import vSelect from 'vue-select'
import VueCurrencyFilter from 'vue-currency-filter';
import numFormat from 'vue-filter-number-format';

const moment = require('moment')
require('moment/locale/fr')

Vue.use(Notifications)
Vue.component('v-select', vSelect)
Vue.use(VueCurrencyFilter,{
  symbol : 'XAF',
  thousandsSeparator: ',',
  fractionCount: 2,
  fractionSeparator: '.',
  symbolPosition: 'front',
  symbolSpacing: true
});
Vue.filter('numFormat', numFormat);
Vue.use(require('vue-moment'), {
    moment
});
Vue.component('pagination', require('laravel-vue-pagination'));

/* 
|--------------------------------------------------------------------------
|                       Composants Module Inventaire
|--------------------------------------------------------------------------
*/

Vue.component('cartes-inventaire', require('./components/Inventaire/CartesInventaire.vue'));
Vue.component('inventaire-hb', require('./components/Inventaire/HuileBase.vue'));
Vue.component('inventaire-additif', require('./components/Inventaire/Additif.vue'));
Vue.component('inventaire-produit-fini', require('./components/Inventaire/ProduitFini.vue'));
Vue.component('liste-stocks', require('./components/Inventaire/StockBase.vue'));
Vue.component('liste-stocks-produit-fini', require('./components/Inventaire/StockProduitFini.vue'));

/* 
|--------------------------------------------------------------------------
|                       Composants Module Achat
|--------------------------------------------------------------------------
*/
                   

Vue.component('creer-demande-achat', require('./components/Achat/CréerDemandeAchat.vue'));
Vue.component('voir-demande-achat', require('./components/Achat/VoirDemandeAchat.vue'));
Vue.component('dossier-demande-achat', require('./components/Achat/DossierDemandeAchat.vue'));

Vue.component('creer-bon-commande', require('./components/Achat/CréerBonCommande.vue'));
Vue.component('voir-bon-commande', require('./components/Achat/VoirBonCommande.vue'));
Vue.component('dossier-demande-achat', require('./components/Achat/DossierDemandeAchat.vue'));
Vue.component('dossier-bon-commande', require('./components/Achat/DossierBonCommande.vue'));



/* 
|--------------------------------------------------------------------------
|                       Composants Module Vente
|--------------------------------------------------------------------------
*/

Vue.component('creer-demande-fabrication', require('./components/Vente/CréerDemandeFabrication.vue'));
Vue.component('voir-demande-fabrication', require('./components/Vente/VoirDemandeFabrication.vue'));
Vue.component('dossier-demande-fabrication', require('./components/Vente/DossierDemandeFabrication.vue'));
Vue.component('creer-bon-fabrication', require('./components/Vente/CréerBonFabrication.vue'));
Vue.component('voir-bon-fabrication', require('./components/Vente/VoirBonFabrication.vue'));
Vue.component('dossier-bon-fabrication', require('./components/Vente/DossierBonFabrication.vue'));


Vue.component('voir-bon-distribution', require('./components/Distribution/VoirBonLivraison.vue'));
Vue.component('creer-bon-livraison', require('./components/Distribution/CréerBonLivraison.vue'));
Vue.component('dossier-bon-distribution', require('./components/Distribution/DossierBonDistribution.vue'));
/* 
|--------------------------------------------------------------------------
|                       Composants Partiels
|--------------------------------------------------------------------------
*/

Vue.component('carte', require('./components/Partials/Carte.vue'));
Vue.component('mini-carte', require('./components/Partials/MiniCarte.vue'));
Vue.comp
const app = new Vue({
    el: '#app',
    
});
