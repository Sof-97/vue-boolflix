<template>
	<div class="d-flex">
		<img
			class="me-auto"
			src="https://image.tmdb.org/t/p/w200/wwemzKWzjKYJFfCeiB57q3r4Bcm.png"
			alt="logo netflix"
		/>
		<input
            placeholder="Cosa vuoi guardare?"
			class="me-5 form-control w-25"
			type="text"
			name="search"
			id="searchInput"
			v-model="searched"
		/>
	</div>
</template>
<script>
export default {
	name: "HeaderComp",
    data(){
        return{
            searched: ""
        }
    }
};
</script>
<style lang="scss" scoped>
div {
	background-color: #000;
	padding: 15px 0;
	img {
		margin-left: 100px;
	}
}
</style>
