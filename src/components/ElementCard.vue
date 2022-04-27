<template>
	<div class="card-info col-2">
		<img
			class="img-fluid"
			:src="`https://image.tmdb.org/t/p/w342/${image}`"
			alt=""
		/>
		<div class="info">
			<h5 class="my-3">{{ title }}</h5>
			<div class="info_sub">
				<p>
					Lingua: {{ language
					}}<span :class="'fi fi-' + language"></span>
				</p>
				<p>Media Voto: {{ voteAverage }}</p>
				<p>
					<i
						:key="i"
						v-for="i in 5"
						class="fa-star"
						:class="i <= averageStar() ? 'fa-solid' : 'fa-regular'"
					></i>
				</p>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	name: "ElementCard",
	props: {
		title: String,
		originalTitle: String,
		language: String,
		voteAverage: String,
		image: String,
	},
	data() {
		return {};
	},
	methods: {
		averageStar() {
			return Math.ceil(Number(this.voteAverage) / 2);
		},
	},
};
</script>
<style lang="scss" scoped>
div.card-info {
	width: calc(100% / 6 - 10px);
	margin-top: 10px;
	box-shadow: -1px -1px 10px 1px rgba($color: #fff, $alpha: 0.3);
	border-radius: 20px;
	background-color: #000;
	color: #fff;
	text-align: center;
	img {
		border-radius: 20px 20px 0 0;
	}
	p {
		margin: 0;
		span {
			margin-left: 5px;
			border-radius: 3px;
		}
	}
	.info {
		min-height: 10em;
		position: relative;
		&_sub{
			width: 100%;
			position: absolute;
			left: 50%;
			transform: translate(-50%);
			bottom: 8px;
		}
	}
}
div.card-info:last-child {
	margin-left: 10px;
	margin-right: auto;
}
.fi-en {
	background-image: url("../../node_modules/flag-icons/flags/4x3/gb.svg");
}
.fi-en.fis {
	background-image: url("../../node_modules/flag-icons/flags/1x1/gb.svg");
}
</style>
