<template>
	<div class="card-info col-2">
		<div class="full">
			<div class="card_front">
				<img v-if="image != null" class="img-fluid" :src="`https://image.tmdb.org/t/p/w342/${image}`" alt="" />
				<div style="height: 340px; padding-top: 50%" v-else>Nessun immagine disponibile</div>
				<div class="info">
					<h5 class="my-3">{{ title }}</h5>
					<div class="info_sub">
						<p>Lingua: {{ language }}<span :class="'fi fi-' + language"></span></p>
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
			<div class="bg-black card_back">
				<p><strong>Titolo:</strong>{{ title }}</p>
				<p><strong>Titolo originale:</strong>{{ originalTitle }}</p>
				<p><strong>Voto:</strong>{{ Math.round(voteAverage * 100) / 100 }}</p>
				<p style="flex-direction: column"><strong>Trama:</strong>{{ overview }}</p>
				<p style="display:block">
					<strong>Attori protagonisti:</strong>
					<span :key="i" v-for="(item, i) in actors.slice(0, 5)">
						<span>{{ item.name }}</span>
						<i v-show="!item.length > i">,</i>
					</span>
				</p>
				<p>
					<strong>Genere/i: </strong>
					<span :key="i" v-for="(item, i) in genre">
						<span>{{ item.name }}</span>
						<i v-show="!item.length > i">,</i>
					</span>
				</p>
			</div>
		</div>
	</div>
</template>

<script>
	import axios from "axios";
	export default {
		name: "ElementCard",
		props: {
			title: String,
			originalTitle: String,
			language: String,
			voteAverage: String,
			image: String,
			overview: String,
			id: Number,
		},
		data() {
			return {
				genre: null,
				actors: null,
			};
		},
		methods: {
			averageStar() {
				return Math.ceil(Number(this.voteAverage) / 2);
			},
		},
		created() {
			axios
				.get(
					"https://api.themoviedb.org/3/movie/" +
						this.id +
						"?api_key=45fcb174ff225f6bfb45caa448731eef&append_to_response=credits"
				)
				.then(res => {
					this.actors = res.data.credits.cast;
					this.genre = res.data.genres;
				});
		},
	};
</script>
<style lang="scss" scoped>
	//Front-back card
	div.card-info:hover .full {
		transform: rotateY(180deg);
	}
	.full {
		height: 530px;
		width: 100%;
		position: relative;
		transition: all 1s linear;
		transform-style: preserve-3d;
		backface-visibility: hidden;
	}
	.card_front,
	.card_back {
		height: 100%;
		width: 100%;
		border-radius: 20px;
		position: absolute;
	}
	.card_front {
		z-index: 2;
		backface-visibility: hidden;
	}
	.card_back {
		backface-visibility: hidden;
		padding: 20px;
		p {
			text-align: justify;
			display: flex;
			font-size: 0.8em;
			strong {
				display: inline;
				margin-right: 4px;
			}
		}
		z-index: 1;
		transform: rotateY(180deg);
	}
	.container {
		perspective: 1000px;
	}
	// Formattazione base
	div.card-info {
		background-color: transparent;
		perspective: 1000px;
		transition: 0.05s all ease-in-out;
		width: calc(100% / 5 - 10px);
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
	}

	.fi-en {
		background-image: url("../../node_modules/flag-icons/flags/4x3/gb.svg");
	}
	.fi-en.fis {
		background-image: url("../../node_modules/flag-icons/flags/1x1/gb.svg");
	}
</style>
