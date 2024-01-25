<template>
    <div class="container">
        <h2 class="text-center mt-3">Inventaire Huile de Base au 15/10/2018</h2>
        <div class="row mt-5">
            <div class="col-md-2">
                <div class="form-inline">
                    <label>Voir
                    <select name="" id="" class="form-control mx-2 input-sm" >
                        <option value="">10</option>
                        <option value="">20</option>
                        <option value="">30</option>
                    </select>Entrées</label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-inline">
                    <label>Filtrer par:
                    <select name="" id="" class="form-control mx-2 input-sm" >
                        <option disabbled selected>Fournisseur</option>
                        <option value="">TOTAL O.M</option>
                        <option value="">LIBYA OIL SUPPLY</option>
                    </select>Entrées</label>
                </div>
            </div>
            <div class="col-md-2 offset-md-3">
                <div class="form-inline">
                    <label for="">Rechercher:
                    <input type="text" class="form-control input-sm mx-3 px-1">
                    </label>
                </div>
            </div>
        </div>
        <table class="table table-bordered mt-4 bg-white text-dark">
            <thead>
                <tr class="bg-primary text-light">
                    <th>Huiles de base</th>
                    <th>Fournisseur</th>
                    <th>Stock Futs ou Cubis</th>
                    <th>Pds Unit.</th>
                    <th>Stock Vrac</th>
                    <th>Stock Total (Kgs)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td scope="row">SN150</td>
                    <td>TOTAL O.M.</td>
                    <td>2</td>
                    <td>860</td>
                    <td></td>
                    <td>1720</td>
                </tr>
                <tr>
                    <td scope="row">A/PE CORE 2500</td>
                    <td>LIBYA OIL SUPPLY</td>
                    <td>58</td>
                    <td>185</td>
                    <td>100</td>
                    <td>10830</td>
                </tr>
            </tbody>
        </table> 
    </div>
</template>
<script>

export default {
    data(){
        return {
            data:{

            }
        }
    }
}
</script>
